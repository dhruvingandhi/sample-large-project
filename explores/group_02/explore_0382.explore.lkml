# Explore: explore_0382
# Auto-generated LookML Explore File

include: "/views/domain_47/view_01147.view.lkml"
include: "/views/domain_49/view_01149.view.lkml"
include: "/views/domain_50/view_01150.view.lkml"
include: "/views/domain_01/view_01151.view.lkml"

explore: explore_0382 {
  label: "Explore Explore 0382"
  description: "Comprehensive analytics explore joining base view_01147 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_01147
  
  always_filter: {
    filters: [view_01147.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01147.created_at_date: "7 days"]
    unless: [view_01147.id, view_01147.status]
  }

  join: view_01149 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01147.user_id} = ${view_01149.id} ;;
    required_joins: []
  }

  join: view_01150 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01147.account_id} = ${view_01150.account_id} ;;
    required_joins: [view_01149]
  }

  join: view_01151 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01147.category} = ${view_01151.category} ;;
  }

  access_filter: {
    field: view_01147.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01147.is_deleted} = false ;;
}
