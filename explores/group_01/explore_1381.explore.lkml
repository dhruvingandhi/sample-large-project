# Explore: explore_1381
# Auto-generated LookML Explore File

include: "/views/domain_44/view_04144.view.lkml"
include: "/views/domain_46/view_04146.view.lkml"
include: "/views/domain_47/view_04147.view.lkml"
include: "/views/domain_48/view_04148.view.lkml"

explore: explore_1381 {
  label: "Explore Explore 1381"
  description: "Comprehensive analytics explore joining base view_04144 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_04144
  
  always_filter: {
    filters: [view_04144.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04144.created_at_date: "7 days"]
    unless: [view_04144.id, view_04144.status]
  }

  join: view_04146 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04144.user_id} = ${view_04146.id} ;;
    required_joins: []
  }

  join: view_04147 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04144.account_id} = ${view_04147.account_id} ;;
    required_joins: [view_04146]
  }

  join: view_04148 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04144.category} = ${view_04148.category} ;;
  }

  access_filter: {
    field: view_04144.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04144.is_deleted} = false ;;
}
