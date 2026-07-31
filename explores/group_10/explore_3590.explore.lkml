# Update for 2000 file diff target
# Explore: explore_3590
# Auto-generated LookML Explore File

include: "/views/domain_21/view_10771.view.lkml"
include: "/views/domain_23/view_10773.view.lkml"
include: "/views/domain_24/view_10774.view.lkml"
include: "/views/domain_25/view_10775.view.lkml"

explore: explore_3590 {
  label: "Explore Explore 3590"
  description: "Comprehensive analytics explore joining base view_10771 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_10771
  
  always_filter: {
    filters: [view_10771.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10771.created_at_date: "7 days"]
    unless: [view_10771.id, view_10771.status]
  }

  join: view_10773 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10771.user_id} = ${view_10773.id} ;;
    required_joins: []
  }

  join: view_10774 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10771.account_id} = ${view_10774.account_id} ;;
    required_joins: [view_10773]
  }

  join: view_10775 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10771.category} = ${view_10775.category} ;;
  }

  access_filter: {
    field: view_10771.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10771.is_deleted} = false ;;
}
