# Explore: explore_0380
# Auto-generated LookML Explore File

include: "/views/domain_41/view_01141.view.lkml"
include: "/views/domain_43/view_01143.view.lkml"
include: "/views/domain_44/view_01144.view.lkml"
include: "/views/domain_45/view_01145.view.lkml"

explore: explore_0380 {
  label: "Explore Explore 0380"
  description: "Comprehensive analytics explore joining base view_01141 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_01141
  
  always_filter: {
    filters: [view_01141.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01141.created_at_date: "7 days"]
    unless: [view_01141.id, view_01141.status]
  }

  join: view_01143 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01141.user_id} = ${view_01143.id} ;;
    required_joins: []
  }

  join: view_01144 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01141.account_id} = ${view_01144.account_id} ;;
    required_joins: [view_01143]
  }

  join: view_01145 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01141.category} = ${view_01145.category} ;;
  }

  access_filter: {
    field: view_01141.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01141.is_deleted} = false ;;
}
