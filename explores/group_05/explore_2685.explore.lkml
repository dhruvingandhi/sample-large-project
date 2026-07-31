# Update for 500 file diff target
# Explore: explore_2685
# Auto-generated LookML Explore File

include: "/views/domain_06/view_08056.view.lkml"
include: "/views/domain_08/view_08058.view.lkml"
include: "/views/domain_09/view_08059.view.lkml"
include: "/views/domain_10/view_08060.view.lkml"

explore: explore_2685 {
  label: "Explore Explore 2685"
  description: "Comprehensive analytics explore joining base view_08056 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_08056
  
  always_filter: {
    filters: [view_08056.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08056.created_at_date: "7 days"]
    unless: [view_08056.id, view_08056.status]
  }

  join: view_08058 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08056.user_id} = ${view_08058.id} ;;
    required_joins: []
  }

  join: view_08059 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08056.account_id} = ${view_08059.account_id} ;;
    required_joins: [view_08058]
  }

  join: view_08060 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08056.category} = ${view_08060.category} ;;
  }

  access_filter: {
    field: view_08056.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08056.is_deleted} = false ;;
}
