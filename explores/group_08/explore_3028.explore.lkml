# Explore: explore_3028
# Auto-generated LookML Explore File

include: "/views/domain_35/view_09085.view.lkml"
include: "/views/domain_37/view_09087.view.lkml"
include: "/views/domain_38/view_09088.view.lkml"
include: "/views/domain_39/view_09089.view.lkml"

explore: explore_3028 {
  label: "Explore Explore 3028"
  description: "Comprehensive analytics explore joining base view_09085 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_09085
  
  always_filter: {
    filters: [view_09085.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09085.created_at_date: "7 days"]
    unless: [view_09085.id, view_09085.status]
  }

  join: view_09087 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09085.user_id} = ${view_09087.id} ;;
    required_joins: []
  }

  join: view_09088 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09085.account_id} = ${view_09088.account_id} ;;
    required_joins: [view_09087]
  }

  join: view_09089 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09085.category} = ${view_09089.category} ;;
  }

  access_filter: {
    field: view_09085.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09085.is_deleted} = false ;;
}
