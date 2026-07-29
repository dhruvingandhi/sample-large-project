# Explore: explore_2222
# Auto-generated LookML Explore File

include: "/views/domain_17/view_06667.view.lkml"
include: "/views/domain_19/view_06669.view.lkml"
include: "/views/domain_20/view_06670.view.lkml"
include: "/views/domain_21/view_06671.view.lkml"

explore: explore_2222 {
  label: "Explore Explore 2222"
  description: "Comprehensive analytics explore joining base view_06667 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_06667
  
  always_filter: {
    filters: [view_06667.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06667.created_at_date: "7 days"]
    unless: [view_06667.id, view_06667.status]
  }

  join: view_06669 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06667.user_id} = ${view_06669.id} ;;
    required_joins: []
  }

  join: view_06670 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06667.account_id} = ${view_06670.account_id} ;;
    required_joins: [view_06669]
  }

  join: view_06671 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06667.category} = ${view_06671.category} ;;
  }

  access_filter: {
    field: view_06667.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06667.is_deleted} = false ;;
}
