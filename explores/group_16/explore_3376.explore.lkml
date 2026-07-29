# Explore: explore_3376
# Auto-generated LookML Explore File

include: "/views/domain_29/view_10129.view.lkml"
include: "/views/domain_31/view_10131.view.lkml"
include: "/views/domain_32/view_10132.view.lkml"
include: "/views/domain_33/view_10133.view.lkml"

explore: explore_3376 {
  label: "Explore Explore 3376"
  description: "Comprehensive analytics explore joining base view_10129 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_10129
  
  always_filter: {
    filters: [view_10129.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10129.created_at_date: "7 days"]
    unless: [view_10129.id, view_10129.status]
  }

  join: view_10131 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10129.user_id} = ${view_10131.id} ;;
    required_joins: []
  }

  join: view_10132 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10129.account_id} = ${view_10132.account_id} ;;
    required_joins: [view_10131]
  }

  join: view_10133 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10129.category} = ${view_10133.category} ;;
  }

  access_filter: {
    field: view_10129.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10129.is_deleted} = false ;;
}
