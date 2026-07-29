# Explore: explore_3013
# Auto-generated LookML Explore File

include: "/views/domain_40/view_09040.view.lkml"
include: "/views/domain_42/view_09042.view.lkml"
include: "/views/domain_43/view_09043.view.lkml"
include: "/views/domain_44/view_09044.view.lkml"

explore: explore_3013 {
  label: "Explore Explore 3013"
  description: "Comprehensive analytics explore joining base view_09040 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_09040
  
  always_filter: {
    filters: [view_09040.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09040.created_at_date: "7 days"]
    unless: [view_09040.id, view_09040.status]
  }

  join: view_09042 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09040.user_id} = ${view_09042.id} ;;
    required_joins: []
  }

  join: view_09043 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09040.account_id} = ${view_09043.account_id} ;;
    required_joins: [view_09042]
  }

  join: view_09044 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09040.category} = ${view_09044.category} ;;
  }

  access_filter: {
    field: view_09040.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09040.is_deleted} = false ;;
}
