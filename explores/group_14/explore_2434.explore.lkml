# Explore: explore_2434
# Auto-generated LookML Explore File

include: "/views/domain_03/view_07303.view.lkml"
include: "/views/domain_05/view_07305.view.lkml"
include: "/views/domain_06/view_07306.view.lkml"
include: "/views/domain_07/view_07307.view.lkml"

explore: explore_2434 {
  label: "Explore Explore 2434"
  description: "Comprehensive analytics explore joining base view_07303 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_07303
  
  always_filter: {
    filters: [view_07303.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07303.created_at_date: "7 days"]
    unless: [view_07303.id, view_07303.status]
  }

  join: view_07305 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07303.user_id} = ${view_07305.id} ;;
    required_joins: []
  }

  join: view_07306 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07303.account_id} = ${view_07306.account_id} ;;
    required_joins: [view_07305]
  }

  join: view_07307 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07303.category} = ${view_07307.category} ;;
  }

  access_filter: {
    field: view_07303.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07303.is_deleted} = false ;;
}
