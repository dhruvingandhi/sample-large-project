# Explore: explore_2981
# Auto-generated LookML Explore File

include: "/views/domain_44/view_08944.view.lkml"
include: "/views/domain_46/view_08946.view.lkml"
include: "/views/domain_47/view_08947.view.lkml"
include: "/views/domain_48/view_08948.view.lkml"

explore: explore_2981 {
  label: "Explore Explore 2981"
  description: "Comprehensive analytics explore joining base view_08944 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_08944
  
  always_filter: {
    filters: [view_08944.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08944.created_at_date: "7 days"]
    unless: [view_08944.id, view_08944.status]
  }

  join: view_08946 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08944.user_id} = ${view_08946.id} ;;
    required_joins: []
  }

  join: view_08947 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08944.account_id} = ${view_08947.account_id} ;;
    required_joins: [view_08946]
  }

  join: view_08948 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08944.category} = ${view_08948.category} ;;
  }

  access_filter: {
    field: view_08944.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08944.is_deleted} = false ;;
}
