# Explore: explore_2681
# Auto-generated LookML Explore File

include: "/views/domain_44/view_08044.view.lkml"
include: "/views/domain_46/view_08046.view.lkml"
include: "/views/domain_47/view_08047.view.lkml"
include: "/views/domain_48/view_08048.view.lkml"

explore: explore_2681 {
  label: "Explore Explore 2681"
  description: "Comprehensive analytics explore joining base view_08044 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_08044
  
  always_filter: {
    filters: [view_08044.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08044.created_at_date: "7 days"]
    unless: [view_08044.id, view_08044.status]
  }

  join: view_08046 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08044.user_id} = ${view_08046.id} ;;
    required_joins: []
  }

  join: view_08047 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08044.account_id} = ${view_08047.account_id} ;;
    required_joins: [view_08046]
  }

  join: view_08048 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08044.category} = ${view_08048.category} ;;
  }

  access_filter: {
    field: view_08044.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08044.is_deleted} = false ;;
}
