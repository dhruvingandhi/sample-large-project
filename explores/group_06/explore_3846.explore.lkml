# Explore: explore_3846
# Auto-generated LookML Explore File

include: "/views/domain_39/view_11539.view.lkml"
include: "/views/domain_41/view_11541.view.lkml"
include: "/views/domain_42/view_11542.view.lkml"
include: "/views/domain_43/view_11543.view.lkml"

explore: explore_3846 {
  label: "Explore Explore 3846"
  description: "Comprehensive analytics explore joining base view_11539 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_11539
  
  always_filter: {
    filters: [view_11539.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11539.created_at_date: "7 days"]
    unless: [view_11539.id, view_11539.status]
  }

  join: view_11541 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11539.user_id} = ${view_11541.id} ;;
    required_joins: []
  }

  join: view_11542 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11539.account_id} = ${view_11542.account_id} ;;
    required_joins: [view_11541]
  }

  join: view_11543 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11539.category} = ${view_11543.category} ;;
  }

  access_filter: {
    field: view_11539.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11539.is_deleted} = false ;;
}
