# Explore: explore_3011
# Auto-generated LookML Explore File

include: "/views/domain_34/view_09034.view.lkml"
include: "/views/domain_36/view_09036.view.lkml"
include: "/views/domain_37/view_09037.view.lkml"
include: "/views/domain_38/view_09038.view.lkml"

explore: explore_3011 {
  label: "Explore Explore 3011"
  description: "Comprehensive analytics explore joining base view_09034 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_09034
  
  always_filter: {
    filters: [view_09034.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09034.created_at_date: "7 days"]
    unless: [view_09034.id, view_09034.status]
  }

  join: view_09036 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09034.user_id} = ${view_09036.id} ;;
    required_joins: []
  }

  join: view_09037 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09034.account_id} = ${view_09037.account_id} ;;
    required_joins: [view_09036]
  }

  join: view_09038 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09034.category} = ${view_09038.category} ;;
  }

  access_filter: {
    field: view_09034.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09034.is_deleted} = false ;;
}
