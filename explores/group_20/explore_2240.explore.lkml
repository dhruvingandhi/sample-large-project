# Explore: explore_2240
# Auto-generated LookML Explore File

include: "/views/domain_21/view_06721.view.lkml"
include: "/views/domain_23/view_06723.view.lkml"
include: "/views/domain_24/view_06724.view.lkml"
include: "/views/domain_25/view_06725.view.lkml"

explore: explore_2240 {
  label: "Explore Explore 2240"
  description: "Comprehensive analytics explore joining base view_06721 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_06721
  
  always_filter: {
    filters: [view_06721.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06721.created_at_date: "7 days"]
    unless: [view_06721.id, view_06721.status]
  }

  join: view_06723 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06721.user_id} = ${view_06723.id} ;;
    required_joins: []
  }

  join: view_06724 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06721.account_id} = ${view_06724.account_id} ;;
    required_joins: [view_06723]
  }

  join: view_06725 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06721.category} = ${view_06725.category} ;;
  }

  access_filter: {
    field: view_06721.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06721.is_deleted} = false ;;
}
