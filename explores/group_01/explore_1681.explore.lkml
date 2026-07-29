# Explore: explore_1681
# Auto-generated LookML Explore File

include: "/views/domain_44/view_05044.view.lkml"
include: "/views/domain_46/view_05046.view.lkml"
include: "/views/domain_47/view_05047.view.lkml"
include: "/views/domain_48/view_05048.view.lkml"

explore: explore_1681 {
  label: "Explore Explore 1681"
  description: "Comprehensive analytics explore joining base view_05044 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_05044
  
  always_filter: {
    filters: [view_05044.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05044.created_at_date: "7 days"]
    unless: [view_05044.id, view_05044.status]
  }

  join: view_05046 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05044.user_id} = ${view_05046.id} ;;
    required_joins: []
  }

  join: view_05047 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05044.account_id} = ${view_05047.account_id} ;;
    required_joins: [view_05046]
  }

  join: view_05048 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05044.category} = ${view_05048.category} ;;
  }

  access_filter: {
    field: view_05044.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05044.is_deleted} = false ;;
}
