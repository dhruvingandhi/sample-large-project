# Explore: explore_3511
# Auto-generated LookML Explore File

include: "/views/domain_34/view_10534.view.lkml"
include: "/views/domain_36/view_10536.view.lkml"
include: "/views/domain_37/view_10537.view.lkml"
include: "/views/domain_38/view_10538.view.lkml"

explore: explore_3511 {
  label: "Explore Explore 3511"
  description: "Comprehensive analytics explore joining base view_10534 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_10534
  
  always_filter: {
    filters: [view_10534.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10534.created_at_date: "7 days"]
    unless: [view_10534.id, view_10534.status]
  }

  join: view_10536 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10534.user_id} = ${view_10536.id} ;;
    required_joins: []
  }

  join: view_10537 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10534.account_id} = ${view_10537.account_id} ;;
    required_joins: [view_10536]
  }

  join: view_10538 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10534.category} = ${view_10538.category} ;;
  }

  access_filter: {
    field: view_10534.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10534.is_deleted} = false ;;
}
