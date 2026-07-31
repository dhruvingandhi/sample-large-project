# Update for 2000 file diff target
# Explore: explore_1957
# Auto-generated LookML Explore File

include: "/views/domain_22/view_05872.view.lkml"
include: "/views/domain_24/view_05874.view.lkml"
include: "/views/domain_25/view_05875.view.lkml"
include: "/views/domain_26/view_05876.view.lkml"

explore: explore_1957 {
  label: "Explore Explore 1957"
  description: "Comprehensive analytics explore joining base view_05872 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_05872
  
  always_filter: {
    filters: [view_05872.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05872.created_at_date: "7 days"]
    unless: [view_05872.id, view_05872.status]
  }

  join: view_05874 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05872.user_id} = ${view_05874.id} ;;
    required_joins: []
  }

  join: view_05875 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05872.account_id} = ${view_05875.account_id} ;;
    required_joins: [view_05874]
  }

  join: view_05876 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05872.category} = ${view_05876.category} ;;
  }

  access_filter: {
    field: view_05872.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05872.is_deleted} = false ;;
}
