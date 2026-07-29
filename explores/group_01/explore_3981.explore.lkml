# Explore: explore_3981
# Auto-generated LookML Explore File

include: "/views/domain_44/view_11944.view.lkml"
include: "/views/domain_46/view_11946.view.lkml"
include: "/views/domain_47/view_11947.view.lkml"
include: "/views/domain_48/view_11948.view.lkml"

explore: explore_3981 {
  label: "Explore Explore 3981"
  description: "Comprehensive analytics explore joining base view_11944 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_11944
  
  always_filter: {
    filters: [view_11944.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11944.created_at_date: "7 days"]
    unless: [view_11944.id, view_11944.status]
  }

  join: view_11946 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11944.user_id} = ${view_11946.id} ;;
    required_joins: []
  }

  join: view_11947 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11944.account_id} = ${view_11947.account_id} ;;
    required_joins: [view_11946]
  }

  join: view_11948 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11944.category} = ${view_11948.category} ;;
  }

  access_filter: {
    field: view_11944.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11944.is_deleted} = false ;;
}
