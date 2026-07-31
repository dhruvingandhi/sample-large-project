# Update for 2000 file diff target
# Explore: explore_0517
# Auto-generated LookML Explore File

include: "/views/domain_02/view_01552.view.lkml"
include: "/views/domain_04/view_01554.view.lkml"
include: "/views/domain_05/view_01555.view.lkml"
include: "/views/domain_06/view_01556.view.lkml"

explore: explore_0517 {
  label: "Explore Explore 0517"
  description: "Comprehensive analytics explore joining base view_01552 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_01552
  
  always_filter: {
    filters: [view_01552.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01552.created_at_date: "7 days"]
    unless: [view_01552.id, view_01552.status]
  }

  join: view_01554 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01552.user_id} = ${view_01554.id} ;;
    required_joins: []
  }

  join: view_01555 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01552.account_id} = ${view_01555.account_id} ;;
    required_joins: [view_01554]
  }

  join: view_01556 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01552.category} = ${view_01556.category} ;;
  }

  access_filter: {
    field: view_01552.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01552.is_deleted} = false ;;
}
