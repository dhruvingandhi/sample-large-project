# Explore: explore_2706
# Auto-generated LookML Explore File

include: "/views/domain_19/view_08119.view.lkml"
include: "/views/domain_21/view_08121.view.lkml"
include: "/views/domain_22/view_08122.view.lkml"
include: "/views/domain_23/view_08123.view.lkml"

explore: explore_2706 {
  label: "Explore Explore 2706"
  description: "Comprehensive analytics explore joining base view_08119 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_08119
  
  always_filter: {
    filters: [view_08119.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08119.created_at_date: "7 days"]
    unless: [view_08119.id, view_08119.status]
  }

  join: view_08121 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08119.user_id} = ${view_08121.id} ;;
    required_joins: []
  }

  join: view_08122 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08119.account_id} = ${view_08122.account_id} ;;
    required_joins: [view_08121]
  }

  join: view_08123 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08119.category} = ${view_08123.category} ;;
  }

  access_filter: {
    field: view_08119.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08119.is_deleted} = false ;;
}
