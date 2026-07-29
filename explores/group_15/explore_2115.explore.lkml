# Explore: explore_2115
# Auto-generated LookML Explore File

include: "/views/domain_46/view_06346.view.lkml"
include: "/views/domain_48/view_06348.view.lkml"
include: "/views/domain_49/view_06349.view.lkml"
include: "/views/domain_50/view_06350.view.lkml"

explore: explore_2115 {
  label: "Explore Explore 2115"
  description: "Comprehensive analytics explore joining base view_06346 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_06346
  
  always_filter: {
    filters: [view_06346.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06346.created_at_date: "7 days"]
    unless: [view_06346.id, view_06346.status]
  }

  join: view_06348 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06346.user_id} = ${view_06348.id} ;;
    required_joins: []
  }

  join: view_06349 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06346.account_id} = ${view_06349.account_id} ;;
    required_joins: [view_06348]
  }

  join: view_06350 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06346.category} = ${view_06350.category} ;;
  }

  access_filter: {
    field: view_06346.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06346.is_deleted} = false ;;
}
