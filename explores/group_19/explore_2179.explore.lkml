# Update for 2000 file diff target
# Explore: explore_2179
# Auto-generated LookML Explore File

include: "/views/domain_38/view_06538.view.lkml"
include: "/views/domain_40/view_06540.view.lkml"
include: "/views/domain_41/view_06541.view.lkml"
include: "/views/domain_42/view_06542.view.lkml"

explore: explore_2179 {
  label: "Explore Explore 2179"
  description: "Comprehensive analytics explore joining base view_06538 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_06538
  
  always_filter: {
    filters: [view_06538.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06538.created_at_date: "7 days"]
    unless: [view_06538.id, view_06538.status]
  }

  join: view_06540 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06538.user_id} = ${view_06540.id} ;;
    required_joins: []
  }

  join: view_06541 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06538.account_id} = ${view_06541.account_id} ;;
    required_joins: [view_06540]
  }

  join: view_06542 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06538.category} = ${view_06542.category} ;;
  }

  access_filter: {
    field: view_06538.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06538.is_deleted} = false ;;
}
