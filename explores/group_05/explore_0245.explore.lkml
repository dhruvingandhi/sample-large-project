# Explore: explore_0245
# Auto-generated LookML Explore File

include: "/views/domain_36/view_00736.view.lkml"
include: "/views/domain_38/view_00738.view.lkml"
include: "/views/domain_39/view_00739.view.lkml"
include: "/views/domain_40/view_00740.view.lkml"

explore: explore_0245 {
  label: "Explore Explore 0245"
  description: "Comprehensive analytics explore joining base view_00736 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_00736
  
  always_filter: {
    filters: [view_00736.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00736.created_at_date: "7 days"]
    unless: [view_00736.id, view_00736.status]
  }

  join: view_00738 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00736.user_id} = ${view_00738.id} ;;
    required_joins: []
  }

  join: view_00739 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00736.account_id} = ${view_00739.account_id} ;;
    required_joins: [view_00738]
  }

  join: view_00740 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00736.category} = ${view_00740.category} ;;
  }

  access_filter: {
    field: view_00736.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00736.is_deleted} = false ;;
}
