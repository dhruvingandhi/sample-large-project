# Explore: explore_0381
# Auto-generated LookML Explore File

include: "/views/domain_44/view_01144.view.lkml"
include: "/views/domain_46/view_01146.view.lkml"
include: "/views/domain_47/view_01147.view.lkml"
include: "/views/domain_48/view_01148.view.lkml"

explore: explore_0381 {
  label: "Explore Explore 0381"
  description: "Comprehensive analytics explore joining base view_01144 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_01144
  
  always_filter: {
    filters: [view_01144.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01144.created_at_date: "7 days"]
    unless: [view_01144.id, view_01144.status]
  }

  join: view_01146 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01144.user_id} = ${view_01146.id} ;;
    required_joins: []
  }

  join: view_01147 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01144.account_id} = ${view_01147.account_id} ;;
    required_joins: [view_01146]
  }

  join: view_01148 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01144.category} = ${view_01148.category} ;;
  }

  access_filter: {
    field: view_01144.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01144.is_deleted} = false ;;
}
