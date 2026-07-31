# Update for 2000 file diff target
# Explore: explore_2739
# Auto-generated LookML Explore File

include: "/views/domain_18/view_08218.view.lkml"
include: "/views/domain_20/view_08220.view.lkml"
include: "/views/domain_21/view_08221.view.lkml"
include: "/views/domain_22/view_08222.view.lkml"

explore: explore_2739 {
  label: "Explore Explore 2739"
  description: "Comprehensive analytics explore joining base view_08218 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_08218
  
  always_filter: {
    filters: [view_08218.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08218.created_at_date: "7 days"]
    unless: [view_08218.id, view_08218.status]
  }

  join: view_08220 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08218.user_id} = ${view_08220.id} ;;
    required_joins: []
  }

  join: view_08221 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08218.account_id} = ${view_08221.account_id} ;;
    required_joins: [view_08220]
  }

  join: view_08222 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08218.category} = ${view_08222.category} ;;
  }

  access_filter: {
    field: view_08218.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08218.is_deleted} = false ;;
}
