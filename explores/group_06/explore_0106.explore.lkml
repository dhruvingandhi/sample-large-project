# Explore: explore_0106
# Auto-generated LookML Explore File

include: "/views/domain_19/view_00319.view.lkml"
include: "/views/domain_21/view_00321.view.lkml"
include: "/views/domain_22/view_00322.view.lkml"
include: "/views/domain_23/view_00323.view.lkml"

explore: explore_0106 {
  label: "Explore Explore 0106"
  description: "Comprehensive analytics explore joining base view_00319 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_00319
  
  always_filter: {
    filters: [view_00319.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00319.created_at_date: "7 days"]
    unless: [view_00319.id, view_00319.status]
  }

  join: view_00321 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00319.user_id} = ${view_00321.id} ;;
    required_joins: []
  }

  join: view_00322 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00319.account_id} = ${view_00322.account_id} ;;
    required_joins: [view_00321]
  }

  join: view_00323 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00319.category} = ${view_00323.category} ;;
  }

  access_filter: {
    field: view_00319.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00319.is_deleted} = false ;;
}
