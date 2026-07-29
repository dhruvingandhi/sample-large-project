# Explore: explore_3896
# Auto-generated LookML Explore File

include: "/views/domain_39/view_11689.view.lkml"
include: "/views/domain_41/view_11691.view.lkml"
include: "/views/domain_42/view_11692.view.lkml"
include: "/views/domain_43/view_11693.view.lkml"

explore: explore_3896 {
  label: "Explore Explore 3896"
  description: "Comprehensive analytics explore joining base view_11689 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_11689
  
  always_filter: {
    filters: [view_11689.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11689.created_at_date: "7 days"]
    unless: [view_11689.id, view_11689.status]
  }

  join: view_11691 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11689.user_id} = ${view_11691.id} ;;
    required_joins: []
  }

  join: view_11692 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11689.account_id} = ${view_11692.account_id} ;;
    required_joins: [view_11691]
  }

  join: view_11693 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11689.category} = ${view_11693.category} ;;
  }

  access_filter: {
    field: view_11689.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11689.is_deleted} = false ;;
}
