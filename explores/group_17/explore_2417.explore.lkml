# Explore: explore_2417
# Auto-generated LookML Explore File

include: "/views/domain_02/view_07252.view.lkml"
include: "/views/domain_04/view_07254.view.lkml"
include: "/views/domain_05/view_07255.view.lkml"
include: "/views/domain_06/view_07256.view.lkml"

explore: explore_2417 {
  label: "Explore Explore 2417"
  description: "Comprehensive analytics explore joining base view_07252 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_07252
  
  always_filter: {
    filters: [view_07252.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07252.created_at_date: "7 days"]
    unless: [view_07252.id, view_07252.status]
  }

  join: view_07254 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07252.user_id} = ${view_07254.id} ;;
    required_joins: []
  }

  join: view_07255 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07252.account_id} = ${view_07255.account_id} ;;
    required_joins: [view_07254]
  }

  join: view_07256 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07252.category} = ${view_07256.category} ;;
  }

  access_filter: {
    field: view_07252.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07252.is_deleted} = false ;;
}
