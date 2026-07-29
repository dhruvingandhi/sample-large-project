# Explore: explore_0344
# Auto-generated LookML Explore File

include: "/views/domain_33/view_01033.view.lkml"
include: "/views/domain_35/view_01035.view.lkml"
include: "/views/domain_36/view_01036.view.lkml"
include: "/views/domain_37/view_01037.view.lkml"

explore: explore_0344 {
  label: "Explore Explore 0344"
  description: "Comprehensive analytics explore joining base view_01033 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_01033
  
  always_filter: {
    filters: [view_01033.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01033.created_at_date: "7 days"]
    unless: [view_01033.id, view_01033.status]
  }

  join: view_01035 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01033.user_id} = ${view_01035.id} ;;
    required_joins: []
  }

  join: view_01036 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01033.account_id} = ${view_01036.account_id} ;;
    required_joins: [view_01035]
  }

  join: view_01037 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01033.category} = ${view_01037.category} ;;
  }

  access_filter: {
    field: view_01033.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01033.is_deleted} = false ;;
}
