# Explore: explore_1981
# Auto-generated LookML Explore File

include: "/views/domain_44/view_05944.view.lkml"
include: "/views/domain_46/view_05946.view.lkml"
include: "/views/domain_47/view_05947.view.lkml"
include: "/views/domain_48/view_05948.view.lkml"

explore: explore_1981 {
  label: "Explore Explore 1981"
  description: "Comprehensive analytics explore joining base view_05944 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_05944
  
  always_filter: {
    filters: [view_05944.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05944.created_at_date: "7 days"]
    unless: [view_05944.id, view_05944.status]
  }

  join: view_05946 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05944.user_id} = ${view_05946.id} ;;
    required_joins: []
  }

  join: view_05947 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05944.account_id} = ${view_05947.account_id} ;;
    required_joins: [view_05946]
  }

  join: view_05948 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05944.category} = ${view_05948.category} ;;
  }

  access_filter: {
    field: view_05944.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05944.is_deleted} = false ;;
}
