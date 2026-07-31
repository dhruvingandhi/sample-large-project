# Update for 2000 file diff target
# Explore: explore_3110
# Auto-generated LookML Explore File

include: "/views/domain_31/view_09331.view.lkml"
include: "/views/domain_33/view_09333.view.lkml"
include: "/views/domain_34/view_09334.view.lkml"
include: "/views/domain_35/view_09335.view.lkml"

explore: explore_3110 {
  label: "Explore Explore 3110"
  description: "Comprehensive analytics explore joining base view_09331 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_09331
  
  always_filter: {
    filters: [view_09331.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09331.created_at_date: "7 days"]
    unless: [view_09331.id, view_09331.status]
  }

  join: view_09333 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09331.user_id} = ${view_09333.id} ;;
    required_joins: []
  }

  join: view_09334 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09331.account_id} = ${view_09334.account_id} ;;
    required_joins: [view_09333]
  }

  join: view_09335 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09331.category} = ${view_09335.category} ;;
  }

  access_filter: {
    field: view_09331.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09331.is_deleted} = false ;;
}
