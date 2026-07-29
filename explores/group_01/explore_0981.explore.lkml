# Explore: explore_0981
# Auto-generated LookML Explore File

include: "/views/domain_44/view_02944.view.lkml"
include: "/views/domain_46/view_02946.view.lkml"
include: "/views/domain_47/view_02947.view.lkml"
include: "/views/domain_48/view_02948.view.lkml"

explore: explore_0981 {
  label: "Explore Explore 0981"
  description: "Comprehensive analytics explore joining base view_02944 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_02944
  
  always_filter: {
    filters: [view_02944.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02944.created_at_date: "7 days"]
    unless: [view_02944.id, view_02944.status]
  }

  join: view_02946 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02944.user_id} = ${view_02946.id} ;;
    required_joins: []
  }

  join: view_02947 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02944.account_id} = ${view_02947.account_id} ;;
    required_joins: [view_02946]
  }

  join: view_02948 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02944.category} = ${view_02948.category} ;;
  }

  access_filter: {
    field: view_02944.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02944.is_deleted} = false ;;
}
