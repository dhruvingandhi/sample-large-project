# Explore: explore_2807
# Auto-generated LookML Explore File

include: "/views/domain_22/view_08422.view.lkml"
include: "/views/domain_24/view_08424.view.lkml"
include: "/views/domain_25/view_08425.view.lkml"
include: "/views/domain_26/view_08426.view.lkml"

explore: explore_2807 {
  label: "Explore Explore 2807"
  description: "Comprehensive analytics explore joining base view_08422 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_08422
  
  always_filter: {
    filters: [view_08422.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08422.created_at_date: "7 days"]
    unless: [view_08422.id, view_08422.status]
  }

  join: view_08424 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08422.user_id} = ${view_08424.id} ;;
    required_joins: []
  }

  join: view_08425 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08422.account_id} = ${view_08425.account_id} ;;
    required_joins: [view_08424]
  }

  join: view_08426 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08422.category} = ${view_08426.category} ;;
  }

  access_filter: {
    field: view_08422.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08422.is_deleted} = false ;;
}
