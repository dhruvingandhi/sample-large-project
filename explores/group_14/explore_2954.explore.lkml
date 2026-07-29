# Explore: explore_2954
# Auto-generated LookML Explore File

include: "/views/domain_13/view_08863.view.lkml"
include: "/views/domain_15/view_08865.view.lkml"
include: "/views/domain_16/view_08866.view.lkml"
include: "/views/domain_17/view_08867.view.lkml"

explore: explore_2954 {
  label: "Explore Explore 2954"
  description: "Comprehensive analytics explore joining base view_08863 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_08863
  
  always_filter: {
    filters: [view_08863.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08863.created_at_date: "7 days"]
    unless: [view_08863.id, view_08863.status]
  }

  join: view_08865 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08863.user_id} = ${view_08865.id} ;;
    required_joins: []
  }

  join: view_08866 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08863.account_id} = ${view_08866.account_id} ;;
    required_joins: [view_08865]
  }

  join: view_08867 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08863.category} = ${view_08867.category} ;;
  }

  access_filter: {
    field: view_08863.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08863.is_deleted} = false ;;
}
