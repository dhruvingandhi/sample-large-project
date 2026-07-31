# Update for 2000 file diff target
# Explore: explore_0999
# Auto-generated LookML Explore File

include: "/views/domain_48/view_02998.view.lkml"
include: "/views/domain_50/view_03000.view.lkml"
include: "/views/domain_01/view_03001.view.lkml"
include: "/views/domain_02/view_03002.view.lkml"

explore: explore_0999 {
  label: "Explore Explore 0999"
  description: "Comprehensive analytics explore joining base view_02998 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_02998
  
  always_filter: {
    filters: [view_02998.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02998.created_at_date: "7 days"]
    unless: [view_02998.id, view_02998.status]
  }

  join: view_03000 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02998.user_id} = ${view_03000.id} ;;
    required_joins: []
  }

  join: view_03001 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02998.account_id} = ${view_03001.account_id} ;;
    required_joins: [view_03000]
  }

  join: view_03002 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02998.category} = ${view_03002.category} ;;
  }

  access_filter: {
    field: view_02998.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02998.is_deleted} = false ;;
}
