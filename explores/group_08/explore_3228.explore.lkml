# Explore: explore_3228
# Auto-generated LookML Explore File

include: "/views/domain_35/view_09685.view.lkml"
include: "/views/domain_37/view_09687.view.lkml"
include: "/views/domain_38/view_09688.view.lkml"
include: "/views/domain_39/view_09689.view.lkml"

explore: explore_3228 {
  label: "Explore Explore 3228"
  description: "Comprehensive analytics explore joining base view_09685 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_09685
  
  always_filter: {
    filters: [view_09685.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09685.created_at_date: "7 days"]
    unless: [view_09685.id, view_09685.status]
  }

  join: view_09687 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09685.user_id} = ${view_09687.id} ;;
    required_joins: []
  }

  join: view_09688 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09685.account_id} = ${view_09688.account_id} ;;
    required_joins: [view_09687]
  }

  join: view_09689 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09685.category} = ${view_09689.category} ;;
  }

  access_filter: {
    field: view_09685.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09685.is_deleted} = false ;;
}
