# Explore: explore_2114
# Auto-generated LookML Explore File

include: "/views/domain_43/view_06343.view.lkml"
include: "/views/domain_45/view_06345.view.lkml"
include: "/views/domain_46/view_06346.view.lkml"
include: "/views/domain_47/view_06347.view.lkml"

explore: explore_2114 {
  label: "Explore Explore 2114"
  description: "Comprehensive analytics explore joining base view_06343 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_06343
  
  always_filter: {
    filters: [view_06343.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06343.created_at_date: "7 days"]
    unless: [view_06343.id, view_06343.status]
  }

  join: view_06345 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06343.user_id} = ${view_06345.id} ;;
    required_joins: []
  }

  join: view_06346 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06343.account_id} = ${view_06346.account_id} ;;
    required_joins: [view_06345]
  }

  join: view_06347 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06343.category} = ${view_06347.category} ;;
  }

  access_filter: {
    field: view_06343.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06343.is_deleted} = false ;;
}
