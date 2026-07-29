# Explore: explore_2055
# Auto-generated LookML Explore File

include: "/views/domain_16/view_06166.view.lkml"
include: "/views/domain_18/view_06168.view.lkml"
include: "/views/domain_19/view_06169.view.lkml"
include: "/views/domain_20/view_06170.view.lkml"

explore: explore_2055 {
  label: "Explore Explore 2055"
  description: "Comprehensive analytics explore joining base view_06166 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_06166
  
  always_filter: {
    filters: [view_06166.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06166.created_at_date: "7 days"]
    unless: [view_06166.id, view_06166.status]
  }

  join: view_06168 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06166.user_id} = ${view_06168.id} ;;
    required_joins: []
  }

  join: view_06169 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06166.account_id} = ${view_06169.account_id} ;;
    required_joins: [view_06168]
  }

  join: view_06170 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06166.category} = ${view_06170.category} ;;
  }

  access_filter: {
    field: view_06166.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06166.is_deleted} = false ;;
}
