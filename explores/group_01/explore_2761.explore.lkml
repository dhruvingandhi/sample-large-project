# Explore: explore_2761
# Auto-generated LookML Explore File

include: "/views/domain_34/view_08284.view.lkml"
include: "/views/domain_36/view_08286.view.lkml"
include: "/views/domain_37/view_08287.view.lkml"
include: "/views/domain_38/view_08288.view.lkml"

explore: explore_2761 {
  label: "Explore Explore 2761"
  description: "Comprehensive analytics explore joining base view_08284 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_08284
  
  always_filter: {
    filters: [view_08284.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08284.created_at_date: "7 days"]
    unless: [view_08284.id, view_08284.status]
  }

  join: view_08286 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08284.user_id} = ${view_08286.id} ;;
    required_joins: []
  }

  join: view_08287 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08284.account_id} = ${view_08287.account_id} ;;
    required_joins: [view_08286]
  }

  join: view_08288 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08284.category} = ${view_08288.category} ;;
  }

  access_filter: {
    field: view_08284.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08284.is_deleted} = false ;;
}
