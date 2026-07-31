# Update for 500 file diff target
# Explore: explore_3142
# Auto-generated LookML Explore File

include: "/views/domain_27/view_09427.view.lkml"
include: "/views/domain_29/view_09429.view.lkml"
include: "/views/domain_30/view_09430.view.lkml"
include: "/views/domain_31/view_09431.view.lkml"

explore: explore_3142 {
  label: "Explore Explore 3142"
  description: "Comprehensive analytics explore joining base view_09427 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_09427
  
  always_filter: {
    filters: [view_09427.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09427.created_at_date: "7 days"]
    unless: [view_09427.id, view_09427.status]
  }

  join: view_09429 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09427.user_id} = ${view_09429.id} ;;
    required_joins: []
  }

  join: view_09430 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09427.account_id} = ${view_09430.account_id} ;;
    required_joins: [view_09429]
  }

  join: view_09431 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09427.category} = ${view_09431.category} ;;
  }

  access_filter: {
    field: view_09427.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09427.is_deleted} = false ;;
}
