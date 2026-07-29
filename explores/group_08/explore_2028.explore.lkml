# Explore: explore_2028
# Auto-generated LookML Explore File

include: "/views/domain_35/view_06085.view.lkml"
include: "/views/domain_37/view_06087.view.lkml"
include: "/views/domain_38/view_06088.view.lkml"
include: "/views/domain_39/view_06089.view.lkml"

explore: explore_2028 {
  label: "Explore Explore 2028"
  description: "Comprehensive analytics explore joining base view_06085 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_06085
  
  always_filter: {
    filters: [view_06085.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06085.created_at_date: "7 days"]
    unless: [view_06085.id, view_06085.status]
  }

  join: view_06087 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06085.user_id} = ${view_06087.id} ;;
    required_joins: []
  }

  join: view_06088 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06085.account_id} = ${view_06088.account_id} ;;
    required_joins: [view_06087]
  }

  join: view_06089 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06085.category} = ${view_06089.category} ;;
  }

  access_filter: {
    field: view_06085.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06085.is_deleted} = false ;;
}
