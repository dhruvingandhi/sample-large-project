# Explore: explore_0268
# Auto-generated LookML Explore File

include: "/views/domain_05/view_00805.view.lkml"
include: "/views/domain_07/view_00807.view.lkml"
include: "/views/domain_08/view_00808.view.lkml"
include: "/views/domain_09/view_00809.view.lkml"

explore: explore_0268 {
  label: "Explore Explore 0268"
  description: "Comprehensive analytics explore joining base view_00805 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_00805
  
  always_filter: {
    filters: [view_00805.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00805.created_at_date: "7 days"]
    unless: [view_00805.id, view_00805.status]
  }

  join: view_00807 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00805.user_id} = ${view_00807.id} ;;
    required_joins: []
  }

  join: view_00808 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00805.account_id} = ${view_00808.account_id} ;;
    required_joins: [view_00807]
  }

  join: view_00809 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00805.category} = ${view_00809.category} ;;
  }

  access_filter: {
    field: view_00805.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00805.is_deleted} = false ;;
}
