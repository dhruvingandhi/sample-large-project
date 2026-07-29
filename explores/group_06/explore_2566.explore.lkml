# Explore: explore_2566
# Auto-generated LookML Explore File

include: "/views/domain_49/view_07699.view.lkml"
include: "/views/domain_01/view_07701.view.lkml"
include: "/views/domain_02/view_07702.view.lkml"
include: "/views/domain_03/view_07703.view.lkml"

explore: explore_2566 {
  label: "Explore Explore 2566"
  description: "Comprehensive analytics explore joining base view_07699 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_07699
  
  always_filter: {
    filters: [view_07699.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07699.created_at_date: "7 days"]
    unless: [view_07699.id, view_07699.status]
  }

  join: view_07701 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07699.user_id} = ${view_07701.id} ;;
    required_joins: []
  }

  join: view_07702 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07699.account_id} = ${view_07702.account_id} ;;
    required_joins: [view_07701]
  }

  join: view_07703 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07699.category} = ${view_07703.category} ;;
  }

  access_filter: {
    field: view_07699.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07699.is_deleted} = false ;;
}
