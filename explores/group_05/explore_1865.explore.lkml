# Update for 500 file diff target
# Explore: explore_1865
# Auto-generated LookML Explore File

include: "/views/domain_46/view_05596.view.lkml"
include: "/views/domain_48/view_05598.view.lkml"
include: "/views/domain_49/view_05599.view.lkml"
include: "/views/domain_50/view_05600.view.lkml"

explore: explore_1865 {
  label: "Explore Explore 1865"
  description: "Comprehensive analytics explore joining base view_05596 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_05596
  
  always_filter: {
    filters: [view_05596.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05596.created_at_date: "7 days"]
    unless: [view_05596.id, view_05596.status]
  }

  join: view_05598 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05596.user_id} = ${view_05598.id} ;;
    required_joins: []
  }

  join: view_05599 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05596.account_id} = ${view_05599.account_id} ;;
    required_joins: [view_05598]
  }

  join: view_05600 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05596.category} = ${view_05600.category} ;;
  }

  access_filter: {
    field: view_05596.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05596.is_deleted} = false ;;
}
