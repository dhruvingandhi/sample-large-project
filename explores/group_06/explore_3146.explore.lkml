# Explore: explore_3146
# Auto-generated LookML Explore File

include: "/views/domain_39/view_09439.view.lkml"
include: "/views/domain_41/view_09441.view.lkml"
include: "/views/domain_42/view_09442.view.lkml"
include: "/views/domain_43/view_09443.view.lkml"

explore: explore_3146 {
  label: "Explore Explore 3146"
  description: "Comprehensive analytics explore joining base view_09439 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_09439
  
  always_filter: {
    filters: [view_09439.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09439.created_at_date: "7 days"]
    unless: [view_09439.id, view_09439.status]
  }

  join: view_09441 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09439.user_id} = ${view_09441.id} ;;
    required_joins: []
  }

  join: view_09442 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09439.account_id} = ${view_09442.account_id} ;;
    required_joins: [view_09441]
  }

  join: view_09443 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09439.category} = ${view_09443.category} ;;
  }

  access_filter: {
    field: view_09439.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09439.is_deleted} = false ;;
}
