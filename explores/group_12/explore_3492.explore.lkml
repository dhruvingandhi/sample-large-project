# Explore: explore_3492
# Auto-generated LookML Explore File

include: "/views/domain_27/view_10477.view.lkml"
include: "/views/domain_29/view_10479.view.lkml"
include: "/views/domain_30/view_10480.view.lkml"
include: "/views/domain_31/view_10481.view.lkml"

explore: explore_3492 {
  label: "Explore Explore 3492"
  description: "Comprehensive analytics explore joining base view_10477 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_10477
  
  always_filter: {
    filters: [view_10477.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10477.created_at_date: "7 days"]
    unless: [view_10477.id, view_10477.status]
  }

  join: view_10479 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10477.user_id} = ${view_10479.id} ;;
    required_joins: []
  }

  join: view_10480 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10477.account_id} = ${view_10480.account_id} ;;
    required_joins: [view_10479]
  }

  join: view_10481 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10477.category} = ${view_10481.category} ;;
  }

  access_filter: {
    field: view_10477.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10477.is_deleted} = false ;;
}
