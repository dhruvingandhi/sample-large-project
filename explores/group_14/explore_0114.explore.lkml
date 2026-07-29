# Explore: explore_0114
# Auto-generated LookML Explore File

include: "/views/domain_43/view_00343.view.lkml"
include: "/views/domain_45/view_00345.view.lkml"
include: "/views/domain_46/view_00346.view.lkml"
include: "/views/domain_47/view_00347.view.lkml"

explore: explore_0114 {
  label: "Explore Explore 0114"
  description: "Comprehensive analytics explore joining base view_00343 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_00343
  
  always_filter: {
    filters: [view_00343.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00343.created_at_date: "7 days"]
    unless: [view_00343.id, view_00343.status]
  }

  join: view_00345 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00343.user_id} = ${view_00345.id} ;;
    required_joins: []
  }

  join: view_00346 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00343.account_id} = ${view_00346.account_id} ;;
    required_joins: [view_00345]
  }

  join: view_00347 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00343.category} = ${view_00347.category} ;;
  }

  access_filter: {
    field: view_00343.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00343.is_deleted} = false ;;
}
