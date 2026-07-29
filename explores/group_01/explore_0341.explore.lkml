# Explore: explore_0341
# Auto-generated LookML Explore File

include: "/views/domain_24/view_01024.view.lkml"
include: "/views/domain_26/view_01026.view.lkml"
include: "/views/domain_27/view_01027.view.lkml"
include: "/views/domain_28/view_01028.view.lkml"

explore: explore_0341 {
  label: "Explore Explore 0341"
  description: "Comprehensive analytics explore joining base view_01024 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_01024
  
  always_filter: {
    filters: [view_01024.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01024.created_at_date: "7 days"]
    unless: [view_01024.id, view_01024.status]
  }

  join: view_01026 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01024.user_id} = ${view_01026.id} ;;
    required_joins: []
  }

  join: view_01027 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01024.account_id} = ${view_01027.account_id} ;;
    required_joins: [view_01026]
  }

  join: view_01028 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01024.category} = ${view_01028.category} ;;
  }

  access_filter: {
    field: view_01024.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01024.is_deleted} = false ;;
}
