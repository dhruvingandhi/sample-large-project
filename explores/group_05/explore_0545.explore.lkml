# Antigravity modified: branch dg-3
# Explore: explore_0545
# Auto-generated LookML Explore File

include: "/views/domain_36/view_01636.view.lkml"
include: "/views/domain_38/view_01638.view.lkml"
include: "/views/domain_39/view_01639.view.lkml"
include: "/views/domain_40/view_01640.view.lkml"

explore: explore_0545 {
  label: "Explore Explore 0545"
  description: "Comprehensive analytics explore joining base view_01636 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_01636
  
  always_filter: {
    filters: [view_01636.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01636.created_at_date: "7 days"]
    unless: [view_01636.id, view_01636.status]
  }

  join: view_01638 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01636.user_id} = ${view_01638.id} ;;
    required_joins: []
  }

  join: view_01639 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01636.account_id} = ${view_01639.account_id} ;;
    required_joins: [view_01638]
  }

  join: view_01640 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01636.category} = ${view_01640.category} ;;
  }

  access_filter: {
    field: view_01636.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01636.is_deleted} = false ;;
}
