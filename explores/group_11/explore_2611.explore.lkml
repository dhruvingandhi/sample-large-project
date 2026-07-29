# Explore: explore_2611
# Auto-generated LookML Explore File

include: "/views/domain_34/view_07834.view.lkml"
include: "/views/domain_36/view_07836.view.lkml"
include: "/views/domain_37/view_07837.view.lkml"
include: "/views/domain_38/view_07838.view.lkml"

explore: explore_2611 {
  label: "Explore Explore 2611"
  description: "Comprehensive analytics explore joining base view_07834 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_07834
  
  always_filter: {
    filters: [view_07834.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07834.created_at_date: "7 days"]
    unless: [view_07834.id, view_07834.status]
  }

  join: view_07836 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07834.user_id} = ${view_07836.id} ;;
    required_joins: []
  }

  join: view_07837 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07834.account_id} = ${view_07837.account_id} ;;
    required_joins: [view_07836]
  }

  join: view_07838 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07834.category} = ${view_07838.category} ;;
  }

  access_filter: {
    field: view_07834.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07834.is_deleted} = false ;;
}
