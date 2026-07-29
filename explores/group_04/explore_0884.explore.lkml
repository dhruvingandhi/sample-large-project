# Explore: explore_0884
# Auto-generated LookML Explore File

include: "/views/domain_03/view_02653.view.lkml"
include: "/views/domain_05/view_02655.view.lkml"
include: "/views/domain_06/view_02656.view.lkml"
include: "/views/domain_07/view_02657.view.lkml"

explore: explore_0884 {
  label: "Explore Explore 0884"
  description: "Comprehensive analytics explore joining base view_02653 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_02653
  
  always_filter: {
    filters: [view_02653.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02653.created_at_date: "7 days"]
    unless: [view_02653.id, view_02653.status]
  }

  join: view_02655 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02653.user_id} = ${view_02655.id} ;;
    required_joins: []
  }

  join: view_02656 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02653.account_id} = ${view_02656.account_id} ;;
    required_joins: [view_02655]
  }

  join: view_02657 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02653.category} = ${view_02657.category} ;;
  }

  access_filter: {
    field: view_02653.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02653.is_deleted} = false ;;
}
