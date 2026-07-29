# Explore: explore_3912
# Auto-generated LookML Explore File

include: "/views/domain_37/view_11737.view.lkml"
include: "/views/domain_39/view_11739.view.lkml"
include: "/views/domain_40/view_11740.view.lkml"
include: "/views/domain_41/view_11741.view.lkml"

explore: explore_3912 {
  label: "Explore Explore 3912"
  description: "Comprehensive analytics explore joining base view_11737 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_11737
  
  always_filter: {
    filters: [view_11737.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11737.created_at_date: "7 days"]
    unless: [view_11737.id, view_11737.status]
  }

  join: view_11739 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11737.user_id} = ${view_11739.id} ;;
    required_joins: []
  }

  join: view_11740 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11737.account_id} = ${view_11740.account_id} ;;
    required_joins: [view_11739]
  }

  join: view_11741 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11737.category} = ${view_11741.category} ;;
  }

  access_filter: {
    field: view_11737.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11737.is_deleted} = false ;;
}
