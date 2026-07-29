# Explore: explore_0982
# Auto-generated LookML Explore File

include: "/views/domain_47/view_02947.view.lkml"
include: "/views/domain_49/view_02949.view.lkml"
include: "/views/domain_50/view_02950.view.lkml"
include: "/views/domain_01/view_02951.view.lkml"

explore: explore_0982 {
  label: "Explore Explore 0982"
  description: "Comprehensive analytics explore joining base view_02947 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_02947
  
  always_filter: {
    filters: [view_02947.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02947.created_at_date: "7 days"]
    unless: [view_02947.id, view_02947.status]
  }

  join: view_02949 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02947.user_id} = ${view_02949.id} ;;
    required_joins: []
  }

  join: view_02950 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02947.account_id} = ${view_02950.account_id} ;;
    required_joins: [view_02949]
  }

  join: view_02951 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02947.category} = ${view_02951.category} ;;
  }

  access_filter: {
    field: view_02947.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02947.is_deleted} = false ;;
}
