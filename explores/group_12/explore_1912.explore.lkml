# Explore: explore_1912
# Auto-generated LookML Explore File

include: "/views/domain_37/view_05737.view.lkml"
include: "/views/domain_39/view_05739.view.lkml"
include: "/views/domain_40/view_05740.view.lkml"
include: "/views/domain_41/view_05741.view.lkml"

explore: explore_1912 {
  label: "Explore Explore 1912"
  description: "Comprehensive analytics explore joining base view_05737 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_05737
  
  always_filter: {
    filters: [view_05737.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05737.created_at_date: "7 days"]
    unless: [view_05737.id, view_05737.status]
  }

  join: view_05739 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05737.user_id} = ${view_05739.id} ;;
    required_joins: []
  }

  join: view_05740 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05737.account_id} = ${view_05740.account_id} ;;
    required_joins: [view_05739]
  }

  join: view_05741 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05737.category} = ${view_05741.category} ;;
  }

  access_filter: {
    field: view_05737.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05737.is_deleted} = false ;;
}
