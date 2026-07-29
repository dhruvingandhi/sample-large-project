# Explore: explore_1028
# Auto-generated LookML Explore File

include: "/views/domain_35/view_03085.view.lkml"
include: "/views/domain_37/view_03087.view.lkml"
include: "/views/domain_38/view_03088.view.lkml"
include: "/views/domain_39/view_03089.view.lkml"

explore: explore_1028 {
  label: "Explore Explore 1028"
  description: "Comprehensive analytics explore joining base view_03085 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_03085
  
  always_filter: {
    filters: [view_03085.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03085.created_at_date: "7 days"]
    unless: [view_03085.id, view_03085.status]
  }

  join: view_03087 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03085.user_id} = ${view_03087.id} ;;
    required_joins: []
  }

  join: view_03088 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03085.account_id} = ${view_03088.account_id} ;;
    required_joins: [view_03087]
  }

  join: view_03089 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03085.category} = ${view_03089.category} ;;
  }

  access_filter: {
    field: view_03085.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03085.is_deleted} = false ;;
}
